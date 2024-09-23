@implementation _UIDiffableDataSourceState

- (_UIDiffableDataSourceState)init
{
  void *v3;
  id v4;
  id v5;
  _UIDataSourceSnapshotter *v6;
  _UIDiffableDataSourceState *v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v6 = objc_alloc_init(_UIDataSourceSnapshotter);
  v7 = -[_UIDiffableDataSourceState initWithGenerationID:identifiers:sections:dataSourceSnapshot:identifiersHaveGuaranteedPerformance:sectionsHaveGuaranteedPerformance:](self, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:identifiersHaveGuaranteedPerformance:sectionsHaveGuaranteedPerformance:", v3, v4, v5, v6, 1, 1);

  return v7;
}

- (_UIDiffableDataSourceState)initWithState:(id)a3
{
  id v4;
  int HaveGuaranteedPerformanceBeforeCopyingState;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIDiffableDataSourceState *v10;
  uint64_t v11;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  uint64_t v13;
  NSOrderedSet *guaranteedPerformanceSections;

  v4 = a3;
  HaveGuaranteedPerformanceBeforeCopyingState = _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(v4);
  objc_msgSend(v4, "generationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDiffableDataSourceState initWithGenerationID:identifiers:sections:dataSourceSnapshot:](self, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:", v6, v7, v8, v9);

  if (v10 && HaveGuaranteedPerformanceBeforeCopyingState)
  {
    objc_msgSend(v4, "guaranteedPerformanceIdentifiers");
    v11 = objc_claimAutoreleasedReturnValue();
    guaranteedPerformanceIdentifiers = v10->_guaranteedPerformanceIdentifiers;
    v10->_guaranteedPerformanceIdentifiers = (NSOrderedSet *)v11;

    objc_msgSend(v4, "guaranteedPerformanceSections");
    v13 = objc_claimAutoreleasedReturnValue();
    guaranteedPerformanceSections = v10->_guaranteedPerformanceSections;
    v10->_guaranteedPerformanceSections = (NSOrderedSet *)v13;

  }
  return v10;
}

- (_UIDiffableDataSourceState)initWithStateAdvancingGenerationID:(id)a3
{
  id v4;
  int HaveGuaranteedPerformanceBeforeCopyingState;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIDiffableDataSourceState *v10;
  uint64_t v11;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  uint64_t v13;
  NSOrderedSet *guaranteedPerformanceSections;

  v4 = a3;
  HaveGuaranteedPerformanceBeforeCopyingState = _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(v4);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDiffableDataSourceState initWithGenerationID:identifiers:sections:dataSourceSnapshot:](self, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:", v6, v7, v8, v9);

  if (v10 && HaveGuaranteedPerformanceBeforeCopyingState)
  {
    objc_msgSend(v4, "guaranteedPerformanceIdentifiers");
    v11 = objc_claimAutoreleasedReturnValue();
    guaranteedPerformanceIdentifiers = v10->_guaranteedPerformanceIdentifiers;
    v10->_guaranteedPerformanceIdentifiers = (NSOrderedSet *)v11;

    objc_msgSend(v4, "guaranteedPerformanceSections");
    v13 = objc_claimAutoreleasedReturnValue();
    guaranteedPerformanceSections = v10->_guaranteedPerformanceSections;
    v10->_guaranteedPerformanceSections = (NSOrderedSet *)v13;

  }
  return v10;
}

- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6
{
  return -[_UIDiffableDataSourceState initWithGenerationID:identifiers:sections:dataSourceSnapshot:identifiersHaveGuaranteedPerformance:sectionsHaveGuaranteedPerformance:](self, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:identifiersHaveGuaranteedPerformance:sectionsHaveGuaranteedPerformance:", a3, a4, a5, a6, 0, 0);
}

- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6 identifiersHaveGuaranteedPerformance:(BOOL)a7 sectionsHaveGuaranteedPerformance:(BOOL)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _UIDiffableDataSourceState *v22;
  _UIDiffableDataSourceState *v23;
  uint64_t v24;
  NSOrderedSet *identifiers;
  uint64_t v26;
  NSOrderedSet *sections;
  uint64_t v28;
  _UICollectionDataSourceSnapshotTranslating *dataSourceSnapshot;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("generationID"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sections"));

      if (v19)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

  if (!v18)
    goto LABEL_21;
LABEL_4:
  if (v19)
    goto LABEL_5;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

LABEL_5:
  v20 = objc_msgSend(v18, "count");
  if (v20 != objc_msgSend(v19, "numberOfSections"))
  {
    _UIDiffableDataSourceValidateIdentifiers(v18, 0);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 158, CFSTR("Section identifier count does not match data source count. This is most likely caused by section identifiers improperly implementing hashing: identifiers that compare as equal must return the same hash value, and the hash value of an identifier should never change once added to diffable."));

  }
  v21 = objc_msgSend(v17, "count");
  if (v21 != objc_msgSend(v19, "numberOfItems"))
  {
    _UIDiffableDataSourceValidateIdentifiers(v17, 1);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 162, CFSTR("Item identifier count does not match data source count. This is most likely caused by item identifiers improperly implementing hashing: identifiers that compare as equal must return the same hash value, and the hash value of an identifier should never change once added to diffable."));

  }
  v37.receiver = self;
  v37.super_class = (Class)_UIDiffableDataSourceState;
  v22 = -[_UIDiffableDataSourceState init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_generationID, a3);
    v24 = objc_msgSend(v17, "copy");
    identifiers = v23->_identifiers;
    v23->_identifiers = (NSOrderedSet *)v24;

    v26 = objc_msgSend(v18, "copy");
    sections = v23->_sections;
    v23->_sections = (NSOrderedSet *)v26;

    +[_UIDataSourceSnapshotter snapshotterForSnapshot:](_UIDataSourceSnapshotter, "snapshotterForSnapshot:", v19);
    v28 = objc_claimAutoreleasedReturnValue();
    dataSourceSnapshot = v23->_dataSourceSnapshot;
    v23->_dataSourceSnapshot = (_UICollectionDataSourceSnapshotTranslating *)v28;

    if (a7
      || -[NSOrderedSet count](v23->_identifiers, "count") < 0xB
      || CVCIs__NSOrderedSetI(v23->_identifiers))
    {
      objc_storeStrong((id *)&v23->_guaranteedPerformanceIdentifiers, v23->_identifiers);
    }
    if (a8
      || -[NSOrderedSet count](v23->_sections, "count") < 0xB
      || CVCIs__NSOrderedSetI(v23->_sections))
    {
      objc_storeStrong((id *)&v23->_guaranteedPerformanceSections, v23->_sections);
    }
  }

  return v23;
}

- (void)validateIdentifiers
{
  _UIDiffableDataSourceValidateIdentifiers(self->_sections, 0);
  _UIDiffableDataSourceValidateIdentifiers(self->_identifiers, 1);
}

- (void)ensureOrderedSetsHaveGuaranteedPerformance
{
  NSOrderedSet *v3;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  NSOrderedSet *v5;
  NSOrderedSet *guaranteedPerformanceSections;

  if (!self->_guaranteedPerformanceIdentifiers)
  {
    v3 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_identifiers);
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v3;

  }
  if (!self->_guaranteedPerformanceSections)
  {
    v5 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_sections);
    guaranteedPerformanceSections = self->_guaranteedPerformanceSections;
    self->_guaranteedPerformanceSections = v5;

  }
}

- (NSOrderedSet)guaranteedPerformanceIdentifiers
{
  return self->_guaranteedPerformanceIdentifiers;
}

- (NSOrderedSet)guaranteedPerformanceSections
{
  return self->_guaranteedPerformanceSections;
}

- (void)willBecomeWiredToDataSource
{
  self->_identifierLookupCount = -1;
  self->_sectionLookupCount = -1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ - %p: dataSourceSnapshot: %@; generationID: %@"),
    v5,
    self,
    self->_dataSourceSnapshot,
    self->_generationID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSUUID)generationID
{
  return self->_generationID;
}

- (NSOrderedSet)identifiers
{
  NSOrderedSet *v3;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  NSOrderedSet *identifiers;

  if (self->_identifierLookupCount >= 0xA && !self->_guaranteedPerformanceIdentifiers)
  {
    v3 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_identifiers);
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v3;

  }
  identifiers = self->_guaranteedPerformanceIdentifiers;
  if (!identifiers)
    identifiers = self->_identifiers;
  return identifiers;
}

- (NSOrderedSet)sections
{
  NSOrderedSet *v3;
  NSOrderedSet *guaranteedPerformanceSections;
  NSOrderedSet *sections;

  if (self->_sectionLookupCount >= 0xA && !self->_guaranteedPerformanceSections)
  {
    v3 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_sections);
    guaranteedPerformanceSections = self->_guaranteedPerformanceSections;
    self->_guaranteedPerformanceSections = v3;

  }
  sections = self->_guaranteedPerformanceSections;
  if (!sections)
    sections = self->_sections;
  return sections;
}

- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (int64_t)numberOfItems
{
  return -[_UICollectionDataSourceSnapshotTranslating numberOfItems](self->_dataSourceSnapshot, "numberOfItems");
}

- (int64_t)numberOfSections
{
  return -[_UICollectionDataSourceSnapshotTranslating numberOfSections](self->_dataSourceSnapshot, "numberOfSections");
}

- (NSArray)sectionIdentifiers
{
  return -[NSOrderedSet array](self->_sections, "array");
}

- (NSArray)itemIdentifiers
{
  return -[NSOrderedSet array](self->_identifiers, "array");
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  int64_t v5;
  void *v7;

  v5 = -[_UIDiffableDataSourceState indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 273, CFSTR("Section identifier was not found. You can verify the section exists by calling the indexOfSectionIdentifier API (which has O(1) performance)"));

  }
  return -[_UICollectionDataSourceSnapshotTranslating numberOfItemsInSection:](self->_dataSourceSnapshot, "numberOfItemsInSection:", v5);
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  v6 = -[_UIDiffableDataSourceState indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v5);
  if ((dyld_program_sdk_at_least() & 1) == 0 && v6 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 286, CFSTR("Section identifier was not found. You can verify the section exists by calling the indexOfSectionIdentifier API (which has O(1) performance)"));

  }
  v7 = -[_UICollectionDataSourceSnapshotTranslating rangeForSection:](self->_dataSourceSnapshot, "rangeForSection:", v6);
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    -[NSOrderedSet array](self->_identifiers, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subarrayWithRange:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  id v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceState.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v6 = -[_UIDiffableDataSourceState indexOfItemIdentifier:](self, "indexOfItemIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (v7 = -[_UICollectionDataSourceSnapshotTranslating sectionForGlobalIndex:](self->_dataSourceSnapshot, "sectionForGlobalIndex:", v6), v7 == 0x7FFFFFFFFFFFFFFFLL)|| (v8 = v7, v7 >= -[_UICollectionDataSourceSnapshotTranslating numberOfSections](self->_dataSourceSnapshot, "numberOfSections")))
  {
    v9 = 0;
  }
  else
  {
    -[NSOrderedSet objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)sectionIndexesForItemIndexRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  length = a3.length;
  location = a3.location;
  v6 = -[_UIDiffableDataSourceState numberOfItems](self, "numberOfItems");
  if (v6 && length && v6 > location)
  {
    if (location + length <= v6)
      v7 = length;
    else
      v7 = v6 - location;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", location, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "firstIndex");
    v10 = objc_msgSend(v8, "lastIndex");
    v11 = -[_UICollectionDataSourceSnapshotTranslating sectionForGlobalIndex:](self->_dataSourceSnapshot, "sectionForGlobalIndex:", v9);
    v12 = -[_UICollectionDataSourceSnapshotTranslating sectionForGlobalIndex:](self->_dataSourceSnapshot, "sectionForGlobalIndex:", v10);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v12 - v11 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  id v4;
  unint64_t identifierLookupCount;
  int64_t v6;
  NSOrderedSet *v7;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  NSOrderedSet *identifiers;

  v4 = a3;
  if (v4)
  {
    identifierLookupCount = self->_identifierLookupCount;
    if (identifierLookupCount >= 0xA)
    {
      if (!self->_guaranteedPerformanceIdentifiers)
      {
        v7 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_identifiers);
        guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
        self->_guaranteedPerformanceIdentifiers = v7;

      }
    }
    else
    {
      self->_identifierLookupCount = identifierLookupCount + 1;
    }
    identifiers = self->_guaranteedPerformanceIdentifiers;
    if (!identifiers)
      identifiers = self->_identifiers;
    v6 = -[NSOrderedSet indexOfObject:](identifiers, "indexOfObject:", v4);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  id v4;
  unint64_t sectionLookupCount;
  int64_t v6;
  NSOrderedSet *v7;
  NSOrderedSet *guaranteedPerformanceSections;
  NSOrderedSet *sections;

  v4 = a3;
  if (v4)
  {
    sectionLookupCount = self->_sectionLookupCount;
    if (sectionLookupCount >= 0xA)
    {
      if (!self->_guaranteedPerformanceSections)
      {
        v7 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_sections);
        guaranteedPerformanceSections = self->_guaranteedPerformanceSections;
        self->_guaranteedPerformanceSections = v7;

      }
    }
    else
    {
      self->_sectionLookupCount = sectionLookupCount + 1;
    }
    sections = self->_guaranteedPerformanceSections;
    if (!sections)
      sections = self->_sections;
    v6 = -[NSOrderedSet indexOfObject:](sections, "indexOfObject:", v4);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)containsItemIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:");
}

- (BOOL)containsSectionIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_sections, "containsObject:");
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  void *v5;

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
  {
    v5 = 0;
  }
  else if (-[_UICollectionDataSourceSnapshotTranslating numberOfSections](self->_dataSourceSnapshot, "numberOfSections") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSOrderedSet objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[_UICollectionDataSourceSnapshotTranslating globalIndexForIndexPath:](self->_dataSourceSnapshot, "globalIndexForIndexPath:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSOrderedSet objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  int64_t v4;
  void *v5;

  v4 = -[_UIDiffableDataSourceState indexOfItemIdentifier:](self, "indexOfItemIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[_UICollectionDataSourceSnapshotTranslating indexPathForGlobalIndex:](self->_dataSourceSnapshot, "indexPathForGlobalIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:", self);
}

- (BOOL)isEqual:(id)a3
{
  _UIDiffableDataSourceState *v4;
  _UIDiffableDataSourceState *v5;
  NSUUID *generationID;
  void *v7;
  NSOrderedSet *sections;
  void *v9;
  NSOrderedSet *identifiers;
  void *v11;
  _UICollectionDataSourceSnapshotTranslating *dataSourceSnapshot;
  void *v13;
  char v14;

  v4 = (_UIDiffableDataSourceState *)a3;
  if (v4 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = 0;
  }
  else
  {
    v5 = v4;
    generationID = self->_generationID;
    -[_UIDiffableDataSourceState generationID](v5, "generationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(generationID) = -[NSUUID isEqual:](generationID, "isEqual:", v7);

    if (!(_DWORD)generationID)
      goto LABEL_8;
    sections = self->_sections;
    -[_UIDiffableDataSourceState sections](v5, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(sections) = -[NSOrderedSet isEqualToOrderedSet:](sections, "isEqualToOrderedSet:", v9);

    if (!(_DWORD)sections)
      goto LABEL_8;
    identifiers = self->_identifiers;
    -[_UIDiffableDataSourceState identifiers](v5, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(identifiers) = -[NSOrderedSet isEqualToOrderedSet:](identifiers, "isEqualToOrderedSet:", v11);

    if ((_DWORD)identifiers)
    {
      dataSourceSnapshot = self->_dataSourceSnapshot;
      -[_UIDiffableDataSourceState dataSourceSnapshot](v5, "dataSourceSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UICollectionDataSourceSnapshotTranslating isEqual:](dataSourceSnapshot, "isEqual:", v13);

    }
    else
    {
LABEL_8:
      v14 = 0;
    }

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guaranteedPerformanceSections, 0);
  objc_storeStrong((id *)&self->_guaranteedPerformanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

@end
