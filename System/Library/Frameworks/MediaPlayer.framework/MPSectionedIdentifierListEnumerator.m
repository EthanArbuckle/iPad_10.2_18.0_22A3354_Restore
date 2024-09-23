@implementation MPSectionedIdentifierListEnumerator

void __49__MPSectionedIdentifierListEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
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

- (MPSectionedIdentifierListEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7
{
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  MPSectionedIdentifierListEnumerator *v17;
  MPSectionedIdentifierListEnumerator *v18;
  uint64_t v19;
  NSMutableArray *nextEmittableEnumerationResults;
  MPSectionedIdentifierListEnumerator *v21;
  uint64_t v22;
  NSMutableArray *contexts;
  void *v24;
  void *v25;
  unint64_t options;
  id *v27;
  __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  dispatch_semaphore_t v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSMutableArray *v45;
  void *v46;
  void *v47;
  id v48;
  NSMutableArray *v49;
  char v50;
  void *v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  NSMutableArray *v57;
  void *v58;
  void *v59;
  char v60;
  unint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  __CFString *v65;
  id *p_sectionedIdentifierList;
  MPSectionedIdentifierListEnumerator *v68;
  char v69;
  _QWORD v70[4];
  dispatch_semaphore_t v71;
  objc_super v72;
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (unint64_t)a5;
  v15 = (unint64_t)a6;
  v16 = a7;
  v69 = a4;
  if ((a4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEnumerator.m"), 45, CFSTR("Cannot instantiate forward enumerator with MPSectionedIdentifierListEnumerationOptionReverse set"));

  }
  if (v14 == v15 && v14 | v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEnumerator.m"), 46, CFSTR("endEntry cannot be the same as the startingEntry"));

  }
  v72.receiver = self;
  v72.super_class = (Class)MPSectionedIdentifierListEnumerator;
  v17 = -[MPSectionedIdentifierListEnumerator init](&v72, sel_init);
  v18 = v17;
  if (v17)
  {
    p_sectionedIdentifierList = (id *)&v17->_sectionedIdentifierList;
    objc_storeStrong((id *)&v17->_sectionedIdentifierList, a3);
    v18->_options = a4;
    v68 = v18;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    nextEmittableEnumerationResults = v18->_nextEmittableEnumerationResults;
    v18->_nextEmittableEnumerationResults = (NSMutableArray *)v19;

    v21 = v18;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    contexts = v18->_contexts;
    v18->_contexts = (NSMutableArray *)v22;

    objc_storeStrong((id *)&v18->_endEntry, a6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v14, "previousEntry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(*p_sectionedIdentifierList, "valueForKey:", CFSTR("_startEntries"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "containsObject:", v14) & 1) == 0)
        {

          v14 = 0;
        }

      }
    }
    options = v18->_options;
    if (v14)
    {
      v62 = v13;
      v27 = p_sectionedIdentifierList;
      if ((v69 & 0x10) == 0)
        objc_msgSend(*p_sectionedIdentifierList, "_enumerator:didEncounterEntry:withExclusiveAccessToken:", v18, v14, v16);
      v60 = options;
      v61 = v14;
      v64 = v16;
      v28 = (__CFString *)(id)v14;
      v63 = *MEMORY[0x1E0D4CE38];
      v65 = v28;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[__CFString sectionHeadEntry](v28, "sectionHeadEntry");
        else
          -[__CFString previousEntry](v28, "previousEntry");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (__CFString *)v29;
        if ((v69 & 0x10) == 0 && v29)
          objc_msgSend(*v27, "_enumerator:didEncounterEntry:withExclusiveAccessToken:", v21, v29, v64);
        -[__CFString nextEntries](v30, "nextEntries");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          v33 = v31;
        }
        else
        {
          objc_msgSend(*v27, "valueForKey:", CFSTR("_startEntries"));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v34 = v33;

        -[__CFString reverseObjectEnumerator](v34, "reverseObjectEnumerator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "nextObjectIdenticalTo:", v28);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          v37 = dispatch_semaphore_create(0);
          v38 = (void *)MEMORY[0x1E0D4D030];
          v73[0] = CFSTR("startEntry");
          v73[1] = CFSTR("innerEntry");
          v74[0] = v65;
          v74[1] = v28;
          if (v30)
            v39 = v30;
          else
            v39 = CFSTR("@");
          v73[2] = CFSTR("previousEntry");
          v73[3] = CFSTR("previousEntry.nextEntries");
          if (v34)
            v40 = v34;
          else
            v40 = CFSTR("@");
          v74[2] = v39;
          v74[3] = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __124__MPSectionedIdentifierListEnumerator_initWithSectionedIdentifierList_options_startEntry_endEntry_withExclusiveAccessToken___block_invoke;
          v70[3] = &unk_1E3163508;
          v71 = v37;
          v43 = v37;
          objc_msgSend(v38, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v63, CFSTR("Bug"), CFSTR("Invalid-SIL"), CFSTR("innerEntry.previousEntry.nextEntries"), &stru_1E3163D10, v42, v70);

          v21 = v68;
          dispatch_semaphore_wait(v43, 0xFFFFFFFFFFFFFFFFLL);

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v68, CFSTR("MPSectionedIdentifierListEnumerator.m"), 106, CFSTR("innerEntry not found in innerEntry.previousEntry.nextEntries"));

          v27 = p_sectionedIdentifierList;
        }
        -[NSMutableArray insertObject:atIndex:](v21->_contexts, "insertObject:atIndex:", v35, 0);

        if (!v30)
          break;
        v28 = v30;
        if (-[__CFString entryType](v30, "entryType") == 2)
        {
          v28 = v30;
          if (!-[__CFString branchDepth](v30, "branchDepth"))
            break;
        }
      }
      v45 = v21->_contexts;
      -[__CFString nextEntries](v65, "nextEntries");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "reverseObjectEnumerator");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v45, "addObject:", v47);

      objc_opt_class();
      v48 = v62;
      if ((objc_opt_isKindOfClass() & 1) != 0 || (v60 & 1) != 0)
        -[NSMutableArray addObject:](v68->_nextEmittableEnumerationResults, "addObject:", v65);
      v14 = v61;
      v16 = v64;
    }
    else
    {
      v48 = v13;
      v49 = v18->_contexts;
      objc_msgSend(*p_sectionedIdentifierList, "_startEntriesWithExclusiveAccessToken:", v16);
      v50 = options;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "reverseObjectEnumerator");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v49, "addObject:", v52);

      if ((v50 & 1) == 0)
        goto LABEL_43;
      v53 = v18->_nextEmittableEnumerationResults;
      +[_MPSectionedIdentifierListProxyEntry startEntry](_MPSectionedIdentifierListProxyEntry, "startEntry");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v53, "addObject:", v54);

      objc_msgSend(*p_sectionedIdentifierList, "_endEntryWithExclusiveAccessToken:", v16);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
        goto LABEL_43;
      v57 = v18->_nextEmittableEnumerationResults;
      +[_MPSectionedIdentifierListProxyEntry endEntry](_MPSectionedIdentifierListProxyEntry, "endEntry");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v57, "addObject:", v30);
    }

    v18 = v68;
LABEL_43:
    _MPSectionedIdentifierListEnumeratorAdjustForStartItemInclusionIfNeeded(v18, v69, (void *)v14, v16);
    v13 = v48;
  }

  return v18;
}

- (id)nextObjectWithExclusiveAccessToken:(id)a3
{
  id v4;
  unint64_t options;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *nextEmittableEnumerationResults;
  void *v10;
  id v11;
  int isKindOfClass;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  MPSectionedIdentifierListEntry *endEntry;
  NSMutableArray *contexts;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  MPSectionedIdentifierListEntry *v28;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  objc_msgSend(v4, "assertHasExclusiveAccessForOwner:", self->_sectionedIdentifierList);
  options = self->_options;
  v31 = (options >> 1) & 1;
  if (-[NSMutableArray count](self->_nextEmittableEnumerationResults, "count"))
  {
    -[NSMutableArray firstObject](self->_nextEmittableEnumerationResults, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_nextEmittableEnumerationResults, "removeObjectAtIndex:", 0);
    if ((options & 1) != 0)
    {
      -[MPSectionedIdentifierListEnumerator sectionedIdentifierList](self, "sectionedIdentifierList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_endEntryWithExclusiveAccessToken:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v8)
      {
        nextEmittableEnumerationResults = self->_nextEmittableEnumerationResults;
        +[_MPSectionedIdentifierListProxyEntry endEntry](_MPSectionedIdentifierListProxyEntry, "endEntry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](nextEmittableEnumerationResults, "addObject:", v10);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v13 = objc_msgSend(v11, "isDataSourceRemoved");
      if ((v13 & 1) == 0 && (isKindOfClass & 1) != 0 && (options & 0x20) == 0)
        v13 = objc_msgSend(v11, "isRemoved");

    }
    else
    {
      v13 = 0;
      isKindOfClass = 0;
    }
    if (((options | isKindOfClass) & 1) != 0
      && v31 | v13 ^ 1
      && ((options & 0x20) == 0
       || (_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v6, v4) & 1) != 0))
    {
      goto LABEL_47;
    }

  }
  if (-[NSMutableArray count](self->_contexts, "count"))
  {
    v30 = 32;
    while (1)
    {
      -[NSMutableArray lastObject](self->_contexts, "lastObject", v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      endEntry = self->_endEntry;
      if (endEntry && v15 == (_QWORD)endEntry)
        break;
      if (v15)
      {
        if ((self->_options & 0x10) == 0)
          -[MPSectionedIdentifierList _enumerator:didEncounterEntry:withExclusiveAccessToken:](self->_sectionedIdentifierList, "_enumerator:didEncounterEntry:withExclusiveAccessToken:", self, v15, v4);
        contexts = self->_contexts;
        objc_msgSend(v16, "nextEntries");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "reverseObjectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](contexts, "addObject:", v21);

        if ((options & 1) != 0)
        {
          -[MPSectionedIdentifierListEnumerator sectionedIdentifierList](self, "sectionedIdentifierList");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_endEntryWithExclusiveAccessToken:", v4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 == v23)
          {
            v24 = *(Class *)((char *)&self->super.super.isa + v30);
            +[_MPSectionedIdentifierListProxyEntry endEntry](_MPSectionedIdentifierListProxyEntry, "endEntry");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v25);

          }
        }
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();
        v27 = objc_msgSend(v16, "isDataSourceRemoved");
        if ((v27 & 1) == 0 && (v26 & 1) != 0 && (options & 0x20) == 0)
          v27 = objc_msgSend(v16, "isRemoved");
        if (((options | v26) & 1) != 0
          && v31 | v27 ^ 1
          && ((options & 0x20) == 0
           || _MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v16, v4)))
        {
          v28 = v16;
          v16 = v28;
          goto LABEL_45;
        }
      }
      else
      {
        -[NSMutableArray removeLastObject](self->_contexts, "removeLastObject");
      }

      if (!-[NSMutableArray count](self->_contexts, "count"))
        goto LABEL_40;
    }
    -[NSMutableArray removeAllObjects](self->_contexts, "removeAllObjects");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "removeAllObjects");
    if ((self->_options & 0x40) == 0)
    {
      v6 = 0;
      goto LABEL_46;
    }
    v28 = self->_endEntry;
LABEL_45:
    v6 = v28;
LABEL_46:

  }
  else
  {
LABEL_40:
    v6 = 0;
  }
LABEL_47:

  return v6;
}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  return self->_sectionedIdentifierList;
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
  v5[2] = __49__MPSectionedIdentifierListEnumerator_nextObject__block_invoke;
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
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_sectionedIdentifierList, 0);
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

intptr_t __124__MPSectionedIdentifierListEnumerator_initWithSectionedIdentifierList_options_startEntry_endEntry_withExclusiveAccessToken___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
